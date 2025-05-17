import asyncio
import logging
import aiohttp
import asyncpg
import os
from aiohttp import ClientSession
from parsers import extract_car_links, fetch_car_detail, extract_total_pages_number
from dotenv import load_dotenv
from math import ceil
from config_logger import setup_logging

setup_logging()
load_dotenv()

DB_SETTINGS = {
    'user': os.getenv('DB_USER'),
    'password': os.getenv('DB_PASSWORD'),
    'database': os.getenv('DB_NAME'),
    'host': os.getenv('DB_HOST'),
    'port': os.getenv('DB_PORT')
}

CAR_INSERT_QUERY = """
INSERT INTO car_info (
    url, title, price_usd, odometer, username,
    phone_number, image_url, images_count,
    car_number, car_vin, datetime_found
) VALUES (
    $1, $2, $3, $4, $5,
    $6, $7, $8,
    $9, $10, $11
) ON CONFLICT (url) DO NOTHING;
"""

SEM = asyncio.Semaphore(10)

async def fetch_and_store_car(session: ClientSession, db_pool, url: str):
    async with SEM:
        try:
            car_data = await fetch_car_detail(session, url)
            if car_data:
                async with db_pool.acquire() as conn:
                    await conn.execute(CAR_INSERT_QUERY, *car_data) # TBD probably batch insert will be performance improvement
        except Exception as e:
            logging.error(f"Error storing car from {url}: {e}")


async def scrap():
    await asyncio.sleep(3)  # ensure PostgreSQL is ready
    db_pool = await asyncpg.create_pool(**DB_SETTINGS)

    async with aiohttp.ClientSession() as session:
        all_car_urls = []
        total_pages = await extract_total_pages_number(session) # extracted pages (10 recs per page)
        adjusted_total_pages = ceil(total_pages / 5) if total_pages != 1 else 1 # calculate total pages with 20 recs per page
        for page in range(1, adjusted_total_pages + 1):
            logging.info(f"Scraping page {page}/{adjusted_total_pages}")
            page_urls = await extract_car_links(session, page)
            all_car_urls.extend(page_urls)

        logging.info(f"Total car URLs collected: {len(all_car_urls)}")

        tasks = [fetch_and_store_car(session, db_pool, url) for url in all_car_urls]
        await asyncio.gather(*tasks)
    logging.info(f"Database bulk finished")

def run_scraper():
    logging.info("Starting scraper...")
    asyncio.run(scrap())

#if __name__ == '__main__':
#    asyncio.run(scrap())
