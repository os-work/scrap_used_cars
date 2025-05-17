# 🚗 Scrap Used Cars (auto.ria.com)

A Python-based asynchronous web scraper that collects car listings from [auto.ria.com](https://auto.ria.com/uk/) and stores structured data in a PostgreSQL database with creating scheduled dumps by cron job.

### 🔍 Scraping Strategy

The scraper operates by targeting the auto.ria.com search result pages using a structured, efficient approach:

*Pagination-Aware Crawling*
It begins by determining the total number of result pages dynamically by parsing the pagination element (<span class="page-item dhide text-c">1 / N</span>). This allows the scraper to adapt automatically to changes in the number of available listings.

*Asynchronous Requests*
It uses aiohttp and asyncio with semaphores to limit concurrency while enabling fast parallel fetching of multiple car listing pages. This significantly improves throughput while staying polite to the target server.

*Selective Parsing*
The scraper visits only relevant URLs filtered by specific criteria (e.g., car listing links) and extracts key data such as title, price, odometer (converted to meters), phone number, VIN, images, etc., using BeautifulSoup.

*Fault Tolerance*
Individual listing parsing is wrapped with error handling and logging, ensuring that one broken or malformed page does not stop the entire scraping process.

*Data Persistence & Dumps*
Results are stored in a PostgreSQL database in a structured format. After each scheduled run, a compressed SQL dump is created for backup and portability.

### ✅ Why It's Efficient
*Non-blocking I/O*: Async programming allows handling many I/O-bound operations simultaneously.

*Minimal Redundancy*: Only necessary pages and fields are processed, reducing overhead.

*Scalability*: The approach can easily scale up (more pages, more frequent runs) or scale out (distribute across nodes).

*Automation-Ready*: Designed with a scheduler and Docker support for fully automated periodic scraping and dumping.

---

## Features

- 🔁 Asynchronous scraping with `aiohttp` and `BeautifulSoup`
- 📦 PostgreSQL integration with `asyncpg`
- 🔍 Parses key fields and handles data issues
- ⚙️ Environment configuration via `.env` file (must be hidden through .gitignore but stays for demo)
- 🐳 Dockerized architecture via Docker Compose
- 🕒 Scheduler support for automatic periodic scraping
- 💾 Auto-generated PostgreSQL database dumps after each run
- ⚠️ Logging and error handling with retry support
- 📊 Handling already-seen URLs are skipped efficiently on db stage with ON CONFLICT which simple and atomic.

---


## Directory Structure

```
.
├── app/
│   ├── dumps/             # Auto-generated database dumps
│   ├── scraper.py         # Main scraping logic
│   ├── parser.py          # Parsing utilities
│   ├── util.py            # Regex, data cleaning helpers
│   ├── db.py              # Database schema creation
│   ├── scheduler.py       # Scheduler with periodic job and dump
│   └── requirements.txt   # Python dependencies
├── .env                   # Environment variables 
├── Dockerfile             # Docker image definition
├── docker-compose.yml     # Docker Compose orchestration
└── README.md              # Project documentation
```

---

## Requirements

- Python 3.11+
- Docker & Docker Compose (recommended)
- PostgreSQL 14+

---

## Quick Start (via Docker)

```bash
# Clone the repository
git clone https://github.com/os-work/scrap_used_cars.git
cd scrap_used_cars

# Copy .env file to the root project and adjust values if needed

# Start the application
docker-compose up --build

**In case of any issues try first:
docker-compose down -v
docker-compose build --no-cache
and then
docker-compose up --build
```

> After each run, a database dump will be saved in the `dumps/` folder.

---

## Environment Configuration

Create a `.env` file in the root directory:

```env
DB_HOST=db
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=postgres
DB_NAME=autoria
```

This will be used both by the Python app and Docker environment.

---

## Local Development

Install dependencies:

```bash
cd app
pip install -r requirements.txt
```

Run manually:

```bash
# Wait for postgres launch script with sleep :)
python wait_for_postgres.py

# Create the table
python db.py

# Run the scraper once
python scraper.py

# Or run the periodic scraper with dump
python scheduler.py
```

Ensure that a local PostgreSQL server is running and accessible based on `.env` settings.

## Output

Scraped data is stored in the PostgreSQL table `car_info`. A `.sql` dump of this table is saved to `/dumps/` after each scheduler run.

---

## TODO

- [ ] Add unit/integration tests
- [ ] Handle proxy/CAPTCHA in case of request blocking
- [ ] Add filtering or search UI but auto ria has bugs
- [ ] Phone number correct scraping
- [ ] Notification support (Slack, Telegram)
- [ ] Measure metrics
- [ ] PoC for distributed scraping and batch inserts

---

## Author

Maintained by [@os-work](https://github.com/os-work)

---

## Performance metrics
Not performed because of deadlines

---

## License

This project is licensed under the MIT License.
Part of this README was generated by ChatGPT:)