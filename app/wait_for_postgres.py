import asyncio
import asyncpg
import os
import logging
from dotenv import load_dotenv
from config_logger import setup_logging

setup_logging()
load_dotenv()

# Waits until postgress connection is ready and retries every 2 seconds if not
async def wait_for_db():
    while True:
        try:
            conn = await asyncpg.connect(
                user=os.getenv("DB_USER"),
                password=os.getenv("DB_PASSWORD"),
                database=os.getenv("DB_NAME"),
                host=os.getenv("DB_HOST"),
                port=os.getenv("DB_PORT")
            )
            await conn.close()
            logging.info("PostgreSQL is ready!")
            return
        except Exception as e:
            logging.warning(f"Waiting for PostgreSQL... {e}")
            await asyncio.sleep(2)

if __name__ == '__main__':
    asyncio.run(wait_for_db())
