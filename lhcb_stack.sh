# -------------------------
# Stack Build
# -------------------------
curl https://gitlab.cern.ch/rmatev/lb-stack-setup/raw/master/setup.py | python3 - TheStack
cd TheStack
lb-set-platform x86_64_v3-centos7-gcc11+detdesc-opt+g
make BINARY_TAG=x86_64_v3-centos7-gcc11+detdesc-opt+g Moore CMAKEFLAGS=-DLOKI_BUILD_FUNCTOR_CACHE=OFF

# -------------------------
# Automation Example
# -------------------------
lb-dev Moore/v54r5 --name=MooreBaseline --platform=x86_64_v3-centos7-gcc11+detdesc-opt+g
cd MooreBaseline
git lb-use Rec
git lb-checkout Rec/v35r5 Pr
git lb-checkout Rec/v35r5 Tr
make

# -------------------------
# Dirac Setup & Usage
# -------------------------
# Request certificate and copy to home directory manually

lb-dirac dirac-cert-convert myCertificate.p12
lhcb-proxy-init

# Fetch sample data file from Dirac
lb-dirac dirac-dms-get-file LFN:/lhcb/MC/Upgrade/XDIGI/00022624/0000/00022624_00000035_2.xdigi

# -------------------------
# ROOT Setup (Conda)
# -------------------------
conda create -n box python=3.9
conda activate box
conda install -c conda-forge root --update-deps

# -------------------------
# Bender Utility
# -------------------------
# Filter out specific error lines from logs
grep -v "Null Track SmartRef in '/Event/Rec/Vertex/Primary'" input.log > output.log

# Explore DST files
lb-run Bender/latest dst-dump -d 2016 -f -n 100 hlt2_test_persistreco_fromfile.dst

# Interactive Python with Moore and DST input
lb-run Moore/v56r2 python -i ../../TrashBin/explore.py --input_file ../Data/hlt2_ks0_persistreco_fromfile.dst --input_process Hlt2 --simulation True
