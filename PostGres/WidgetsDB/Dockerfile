# Start from the official PostgreSQL image
FROM postgres:15

# Set environment variables (can be overridden at runtime)
ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=secret
ENV POSTGRES_DB=widgets_db

# Optional: copy initialization scripts into the container
# These scripts will run on first container start
COPY ./init.sql /docker-entrypoint-initdb.d/

# Expose the default PostgreSQL port
EXPOSE 5436