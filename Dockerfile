FROM archlinux:latest

# Update system and install essential packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm sudo git

# Create a non-root user for testing
RUN useradd -m -G wheel -s /bin/bash testuser && \
    echo 'testuser ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Set up working directory
WORKDIR /geoloc-os

# Copy the install scripts
COPY . /geoloc-os/

# Change ownership to testuser
RUN chown -R testuser:testuser /geoloc-os

# Switch to testuser
USER testuser

# Set environment variables for non-interactive installs
ENV DEBIAN_FRONTEND=noninteractive

CMD ["/bin/bash"]