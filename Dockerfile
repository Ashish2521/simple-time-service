FROM python:3.11-slim

# Create app user in a group valled appgroup
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser

# Set working directory

WORKDIR /app

# Copy dependencies file and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
# Copy app code
COPY . .

# Set ownership of all files to root user
RUN chown -R appuser:appgroup /app

# Switch to non root user
User appuser

# Expose timeservice app port
EXPOSE 8000

# Run application
CMD ["python", "main.py"]


