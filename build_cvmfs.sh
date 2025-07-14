# --- System Prep ---
sudo systemctl stop autofs

# Remove any previous CVMFS installation
sudo dnf remove -y cvmfs cvmfs-config-default cvmfs-fuse3 cvmfs-release
sudo rm -rf /etc/cvmfs/ /var/lib/cvmfs/

# --- Install CVMFS ---
sudo dnf install -y https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm
sudo dnf install -y cvmfs cvmfs-config-default cvmfs-fuse3

# --- Configure CVMFS ---
sudo tee /etc/cvmfs/default.local > /dev/null <<EOF
CVMFS_REPOSITORIES='lhcb.cern.ch'
CVMFS_HTTP_PROXY='DIRECT'
CVMFS_QUOTA_LIMIT='10000'
CVMFS_CLIENT_PROFILE='single'
EOF

# --- Setup & Verify ---
sudo cvmfs_config setup
sudo systemctl restart autofs
cvmfs_config probe
sudo cvmfs_config chksetup

# --- Source LHCb Environment ---
source /cvmfs/lhcb.cern.ch/lib/LbEnv
which python



# --- Optional Dev Tools ---

sudo dnf install -y make cmake gcc gcc-c++ \
    glibc-devel glibc-headers libstdc++-devel \
    openssl-devel zlib-devel pkgconfig pcre-devel
