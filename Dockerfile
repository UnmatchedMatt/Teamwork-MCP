FROM node:18

# Create service user
RUN useradd -m service-user
USER service-user
WORKDIR /app

# Copy all files
COPY . .

# Install dependencies (if any — some MCP packages run standalone)
RUN npm install -g @vizioz/teamwork-mcp

# Set environment variables here if desired, or do it in Railway
ENV TEAMWORK_DOMAIN=""
ENV TEAMWORK_USER=""
ENV TEAMWORK_PASS=""

# Start the MCP server directly
CMD ["teamwork-mcp"]
