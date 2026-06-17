# =====================================================================
# Copyright (c) 2026 Jeremy McGehee (Klankton)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU Affero General Public License for more details.
# =====================================================================
# Drawing natively from PyTorch CUDA 12.1 runtime matrix layers
FROM pytorch/pytorch:2.2.1-cuda12.1-cudnn8-runtime

WORKDIR /app

# Install system dependencies for Tkinter and X11 graphics rendering
RUN apt-get update && apt-get install -y \
    python3-tk \
    libx11-6 \
    && rm -rf /var/lib/apt/lists/*

# Copy dependencies and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy everything else
COPY . .

# Default fallback execution entrypoint
CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8000"]
