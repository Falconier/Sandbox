import requests
from bs4 import BeautifulSoup
from datetime import datetime, timedelta, date, time

today = datetime.today()
formated_date = today.strftime("%A-%B-%d-%Y").lower()
print(formated_date)
url = "https://moravian.org/daily_texts/" + formated_date

print(url)

response = requests.get(url)

text = ""

if response.status_code == 200:
    context = BeautifulSoup(response.text, 'html.parser')

    text = context.get_text()
else:

    print(f"Failed to retrieve the website. Status Code: {response.status_code}")

if len(text) > 0:
    start_index = text.index("Daily Text\n")
    end_index = text.index("Amen")

    filter_text = text[start_index:end_index]

    print(filter_text)