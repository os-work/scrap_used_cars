import asyncpg
import logging
import os
from dotenv import load_dotenv

load_dotenv()

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

async def create_database_table():
    conn = await asyncpg.connect(
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME"),
        host=os.getenv("DB_HOST"),
        port=os.getenv("DB_PORT")
    )
    await conn.execute("""
    CREATE TABLE IF NOT EXISTS car_info (
        url VARCHAR PRIMARY KEY,
        title VARCHAR,
        price_usd INTEGER,
        odometer INTEGER,
        username VARCHAR,
        phone_number BIGINT,
        image_url VARCHAR,
        images_count INTEGER,
        car_number VARCHAR,
        car_vin VARCHAR,
        datetime_found TIMESTAMPTZ
    );
    """)
    logging.info(f"Table car_info created. (if not exist)")
    await conn.close()

if __name__ == '__main__':
    import asyncio
    asyncio.run(create_database_table())