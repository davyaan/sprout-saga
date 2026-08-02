FROM instrumentisto/flutter:3.41.6-androidsdk36-r0

# convex_flutter builds a native Rust component (via Cargokit) for Android at
# compile time, not just for real-device runs — required even for a debug APK.
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable \
    && rustup target add aarch64-linux-android armv7-linux-androideabi i686-linux-android x86_64-linux-android

WORKDIR /app
