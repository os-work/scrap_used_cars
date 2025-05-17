import subprocess
import os
import logging
from apscheduler.schedulers.blocking import BlockingScheduler
from datetime import datetime
from scraper import run_scraper
from dotenv import load_dotenv

load_dotenv()

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def create_db_dump():
    dump_dir = os.path.join(os.getcwd(), "dumps")
    os.makedirs(dump_dir, exist_ok=True)
    
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    dump_path = os.path.join(dump_dir, f"car_info_dump_{timestamp}.sql")

    command = [
        "pg_dump",
        "-h", os.getenv("DB_HOST"),
        "-p", os.getenv("DB_PORT"),
        "-U", os.getenv("DB_USER"),
        "-d", os.getenv("DB_NAME"),
        "-t", "car_info",
        "-f", dump_path
    ]

    env = os.environ.copy()
    env["PGPASSWORD"] = os.getenv("DB_PASSWORD")

    try:
        subprocess.run(command, check=True, env=env)
        logging.info(f"Database dump created at {dump_path}")
    except subprocess.CalledProcessError as e:
        logging.error(f"Error creating DB dump: {e}")


def start_scheduler():
    scheduler = BlockingScheduler()
    
    # Run every day at 12:00 AM
    scheduler.add_job(run_scraper, 'cron', hour=12, minute=0)

    logging.info("Scheduler started. Scraper will run daily at 12:00.")
    try:
        scheduler.start()
    except (KeyboardInterrupt, SystemExit):
        logging.warn("Scheduler stopped.")

if __name__ == "__main__":
    start_scheduler()
    #run_scraper()
    create_db_dump()

