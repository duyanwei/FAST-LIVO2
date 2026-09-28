FROM osrf/ros:noetic-desktop-full

ENV DEBIAN_FRONTEND=noninteractive

# ---------- System + ROS dependencies ----------
RUN apt-get update && apt-get install -y \
    git \
    wget \
    build-essential \
    cmake \
    pkg-config \
    python3-catkin-tools \
    python3-pip \
    libeigen3-dev \
    libpcl-dev \
    libopencv-dev \
    libgoogle-glog-dev \
    libgflags-dev \
    libsuitesparse-dev \
    libyaml-cpp-dev \
    ros-noetic-pcl-ros \
    ros-noetic-cv-bridge \
    ros-noetic-tf \
    ros-noetic-geometry-msgs \
    ros-noetic-nav-msgs \
    ros-noetic-sensor-msgs \
    ros-noetic-tf2 \
    ros-noetic-tf2-ros \
    && rm -rf /var/lib/apt/lists/*

# Install OSQP via pip (instead of apt)
RUN pip3 install --upgrade pip && \
    python3 -m pip install osqp

# ---------- Install Sophus ----------
WORKDIR /root
RUN git clone https://github.com/strasdat/Sophus.git && \
    cd Sophus && \
    git checkout a621ff && \
    sed -i 's/unit_complex_.real() = \(.*\);/unit_complex_ = std::complex<double>(\1, unit_complex_.imag());/' sophus/so2.cpp && \
    sed -i 's/unit_complex_.imag() = \(.*\);/unit_complex_ = std::complex<double>(unit_complex_.real(), \1);/' sophus/so2.cpp && \
    mkdir build && cd build && \
    cmake .. && \
    make -j$(nproc) && \
    make install

# ---------- Catkin workspace ----------
WORKDIR /root/catkin_ws/src

RUN git clone https://github.com/duyanwei/FAST-LIVO2.git
RUN git clone https://github.com/xuankuzcr/rpg_vikit.git

# ---------- Build ----------
WORKDIR /root/catkin_ws
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && catkin_make -DCMAKE_BUILD_TYPE=Release"

# ---------- Env ----------
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc && \
    echo "source /root/catkin_ws/devel/setup.bash" >> ~/.bashrc

CMD ["/bin/bash"]