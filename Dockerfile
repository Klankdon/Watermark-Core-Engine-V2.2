# Using a full python image which already includes standard system media/graphics libraries
FROM python:3.11

WORKDIR /app

# Copy dependencies and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy everything else
COPY . .
