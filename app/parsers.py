import aiohttp
import os
import re

from bs4 import BeautifulSoup
from datetime import datetime
from dotenv import load_dotenv

load_dotenv()

HEADERS = {
    "User-Agent": "Mozilla/5.0"
}
URL = os.getenv('AUTO_RIA_URL', 'https://auto.ria.com/uk/car/used/')

# Amount cars displayed on one page, defaulting to 20
TOTAL_ITEMS_PER_PAGE = int(os.getenv('ITEMS_PER_PAGE', 20))

async def extract_total_pages_number(session: aiohttp.ClientSession) -> int:
    try:
        async with session.get(URL, headers=HEADERS) as resp:
            html = await resp.text()
            soup = BeautifulSoup(html, 'html.parser')
            span = soup.select_one('span.page-item.dhide.text-c')
    
            if not span:
                return 1

            match = re.search(r'/\s*([\d\s]+)', span.get_text())
            if match:
                number_str = match.group(1).replace(' ', '')
                return int(number_str)
    
            return 1  # Fallback if no match found
    except Exception:
        return None


async def extract_car_links(session: aiohttp.ClientSession, page_number: int) -> list[str]:  
    try:  
        async with session.get(URL, headers=HEADERS, params={'page': page_number}) as resp:  
            html = await resp.text()  
            soup = BeautifulSoup(html, 'html.parser')  
            links = soup.select('a.address')  
            return filter_valid_links(links)  
    except Exception:  
        return []

async def fetch_car_detail(session: aiohttp.ClientSession, url: str) -> tuple | None:
    try:
        async with session.get(url, headers=HEADERS) as resp:         
            html = await resp.text()
            soup = BeautifulSoup(html, 'html.parser')

            title = soup.select_one('h1.head').text.strip()
            price_usd = parse_price(soup.select_one('.price_value').get_text(strip=True))

            odometer_tag = soup.find('span', string=lambda s: s and 'тис. км' in s)
            odometer = parse_odometer(odometer_tag.text) if odometer_tag else 0

            username_tag = soup.select_one('.seller_info_area .seller_info_name')
            if username_tag:
                username = username_tag.text.strip()
            else:
                username = "Sold" # In case username is empty car is already sold 

            #TBD phone number scraping with Selenium or find out API way
            phone_data = soup.select_one('[data-phone-number]')
            if phone_data:
                phone_number = parse_content(phone_data)
            else:
                phone_number = 'None'

            image_url = soup.select_one('.photo-620x465 img')
            image_url = image_url['src'] if image_url else ''

            images = soup.select('div.photo-620x465 img')
            image_count = len(images)

            car_num_element = soup.select_one('.state-num')
            if car_num_element:
                car_num = parse_content(car_num_element)
            else:
                car_num = 'None'

            car_vin_element = soup.select_one('.label-vin')
            if car_vin_element:
                car_vin = car_vin_element.text.strip()
            else:
                car_vin = 'None'

            datetime_found = datetime.utcnow()

            return (
                url, title, price_usd, odometer, username,
                phone_number, image_url, image_count,
                car_num, car_vin, datetime_found
            )
    except Exception as e:
        raise ValueError(f"Error parsing car page {url}: {e}")


def filter_valid_links(links: list) -> list[str]:  
    """  
    Filters valid car links, excluding those containing 'newauto' as the scope is used cars
    """  
    return [link['href'] for link in links if link.get('href') and 'newauto' not in link['href']]  

def parse_price(price_text: str) -> int:
    digits = re.sub(r'[^\d]', '', price_text)
    return int(digits) if digits else 0

def parse_odometer(raw_text: str) -> int:
    """
    Parses odometer text like '208 тис. км' into integer kilometers.
    """
    if not raw_text:
        return 0
    raw_text = raw_text.lower()
    # Match patterns like "208 тис. км" or "100 км"
    match = re.search(r'([\d\s]+)(?:\s*тис)?', raw_text)
    if match:
        number = int(match.group(1).replace(' ', ''))
        return number * 1000 if 'тис' in raw_text else number
    return 0

def parse_content(raw_text: str) -> str:
    if raw_text and raw_text.contents:
        return raw_text.contents[0].text.strip()
    return 'None'