#!/bin/bash
rm -rf one two three four five six seven eight nine ten eleven

if [ -e ~/faceunlock ]; then
   echo ""
else
   echo "Clone faceunlock and rerun script"
   sleep 3
   exit
fi

# Abort on errors
set -e

BUILD_START=$(date +"%s")
blue='\033[0;34m'
cyan='\033[0;36m'
yellow='\033[0;33m'
red='\033[0;31m'
nocol='\033[0m'

read -e -p "Do you want to sync source?[y/n]: " ans0;

case $ans0 in
   y|Y)
        echo -e "$blue// Syncing DerpFest Source //$nocol"
        repo init -u git://github.com/DerpLab/platform_manifest.git -b ten
	repo sync --current-branch --no-tags --no-clone-bundle --optimized-fetch --force-sync -j$(nproc --all) --quiet;;
   n|N)
	echo -e "$yellow// Skipping syncing source //$nocol";;
esac
echo " "
echo " "

# Doing Sanders-ify


echo "1. Pick commits of frameworks/base"
echo "2. Pick commits of DerpQuest"
echo "3. Pick commits of build/make"
echo "4. Pick commits of vendor/overlay"
echo "5. Pick commits of Settings"
echo "6. Pick commits of vendor/pixelstyle"
echo "7. Pick commits of vendor/aosip"
echo "8. Pick commits of OmniStyle"
echo "9. Import FaceUnlock feature"
echo "10. Sepolicy-legacy-um from PE"
echo "11. Import USAP Zygote"
echo "12. Pick commits of every repo above"
read -e -p "Select anyone from above: " ans;

case $ans in
   1)
	mkdir one;;
   2)
	mkdir two;;
   3)
	mkdir three;;
   4)
	mkdir four;;
   5)
	mkdir five;;
   6)
	mkdir six;;
   7)
	mkdir seven;;
   8)
	mkdir eight;;
   9)
	mkdir nine;;
   10)
        mkdir ten;;
   11)
        mkdir eleven;;
   12)
	mkdir one two three four five six seven eight nine ten eleven;;
esac



## fw/base
if [ -e one ]
then
echo -e "$blue// Picking commits of frameworks/base //$nocol"
cd frameworks/base
git fetch https://github.com/DerpFest-Sanders/platform_frameworks_base fp2
# OOS dismiss all
git cherry-pick fe4597c932814f829e3c9ff054b341f4a44191d6^..5bb88ca5ce0fd5385d25cd21266402de8111aa04
# New clocks
git cherry-pick 448602c92eca13f1a599cb276b5d87600115c1e6^..53b0989940e7dec512443c0cd642689c913ea391
# brightness +- icons
git cherry-pick 9b2e6f5b2abdec3910bc041267e83264dfef349f
# fast fp
#git cherry-pick 9811688a8323512286f385a2446d61fa57831357 #remove keyguard delay completely
#git cherry-pick 72321ba13fa8dd1c943d728b4e089b6a65bc1f3d #skip screen on animtaion
#git cherry-pick 94760b652324a00d5bdfa17cf60aca1cdbee9392 #kill some ls related animation
#git cherry-pick 6f56f6636056c18c81ac8b7000ef88f9e6fe8aa4 #SystemUI: use fp MODE_UNLOCK when pulsing or aod
# remove extra fod animations
git cherry-pick 5ce9197f1b54cf9c70b4cb7544f4c26329cebf37^..c34e5a43a2c96943be611dbc826d099400e94452
#NotificationPanelView: Fix initial touch co-ordinates
#git cherry-pick 16c253fec36344d3a2b706b17399fe22b0287e6a
# tweak navbar
#git cherry-pick 2b1d259c8001c2e4608f398712f51afea2c00fef
#git chrrry-pick 9fa588395bb6a090389c2ef1ad116c87274db2e3
cd ../..
echo " "
echo " "
rm -rf one
sleep 2
fi

## DerpQuest
if [ -e two ]
then
echo -e "$blue// Picking commits of DerpQuest //$nocol"
cd pac*/apps/DerpQuest
git fetch https://github.com/DerpFest-Sanders/platform_packages_apps_DerpQuest new6
git cherry-pick 6a76975bfe0127f4c9ab1d0a4e31f909d23897c4^..808b6fd8674cc56cc25541f1c53a38583c3dc9f3
git fetch https://github.com/DerpFest-Sanders/platform_packages_apps_DerpQuest fod
git cherry-pick 5ba0c4324f077845d177a4a89479efd868d96b30^..45762068d7fb8db243a301302e485b3e18c0998c
git push -f https://github.com/DerpFest-Sanders/platform_packages_apps_DerpQuest HEAD:ten2
cd ../../..
echo " "
echo " "
rm -rf two
fi

## build/make
if [ -e three ]
then
echo -e "$blue// Picking commits of build //$nocol"
cd build/make
git fetch https://github.com/DerpFest-Sanders/platform_build mine
git cherry-pick fea68116eb2232e376d6a7d90af177b1f6bc7f0f
git push -f https://github.com/DerpFest-Sanders/platform_build HEAD:ten2
cd ../..
echo " "
echo " "
rm -rf three
fi

## vendor/overlay
if [ -e four ]
then
echo -e "$blue// Picking commits of vendor/overlay //$nocol"
cd vendor/overlay
git fetch https://github.com/DerpFest-Sanders/platform_vendor_overlay ten
#git cherry-pick c425885cbeb5d9c9e21694aa351e5b6a133efe04
git cherry-pick 5d8a1215c40bbc2b95c393e6d02735eb03487583
git push -f https://github.com/DerpFest-Sanders/platform_vendor_overlay HEAD:ten2
cd ../..
echo " "
echo " "
rm -rf four
fi

## Settings
if [ -e five ]
then
echo -e "$blue// Picking commits of Settings //$nocol"
cd pac*/apps/Settings
git fetch https://github.com/DerpFest-Sanders/platform_packages_apps_Settings ten
#git cherry-pick af1e4c66fef50c675ac532caa71f1f3f6a9c7b58
git cherry-pick 6616745020095024164bf7b31c2f6d0771d1ba3a
#git push -f https://github.com/DerpFest-Sanders/platform_packages_apps_Settings HEAD:ten2
cd ../../..
echo " "
echo " "
sleep 3
rm -rf five
fi

## vendor/pixelstyle
if [ -e six ]
then
echo -e "$blue// Picking commits of vendor/pixelstyle //$nocol"
cd vendor/pixelstyle
git fetch https://github.com/DerpFest-Sanders/platform_vendor_pixelstyle ten
git cherry-pick 1257ecbfad11bf1e0e7e9f455b077d6906019ad5
git push -f https://github.com/DerpFest-Sanders/platform_vendor_pixelstyle HEAD:ten2
cd ../..
echo " "
echo " "
rm -rf six
fi

## vendor/aosip
if [ -e seven ]
then
echo -e "$blue// Picking commits of vendor/aosip //$nocol"
cd vendor/aosip
git fetch https://github.com/DerpFest-Sanders/platform_vendor_aosip ten
git cherry-pick 626d2a6278b5b55db8a14e567660c89b75922e92
git push -f https://github.com/DerpFest-Sanders/platform_vendor_aosip HEAD:ten2
cd ../..
echo " "
echo " "
rm -rf seven
fi

## OmniStyle
if [ -e eight ]
then
echo -e "$blue// Picking commits of OmniStyle //$nocol"
cd pac*/apps/OmniStyle
git fetch https://github.com/DerpFest-Sanders/platform_packages_apps_OmniStyle ten
git cherry-pick 568431bd327180c0c7a9147a649c0bf6af270b73
git push -f https://github.com/DerpFest-Sanders/platform_packages_apps_OmniStyle HEAD:ten2
cd ../../..
echo " "
echo " "
rm -rf eight
fi

# FaceUnlock
if [ -e nine ]
then
echo -e "$blue// Importing Face Unlock //$nocol"
rm -rf external/motorola/faceunlock
cd external
if [ -e motorola ]
then
echo " "
else
mkdir motorola
fi
cd && cp -r faceunlock dp/external/motorola/faceunlock
#git clone https://github.com/PixelExperience/external_motorola_faceunlock -b ten external/motorola/faceunlock
cd dp
cd vendor/aosip
git fetch https://github.com/DerpFest-Sanders/platform_vendor_aosip face
git cherry-pick 300b9fa1bcdca6f4755994922b3205d94d25704b
git push -f https://github.com/DerpFest-Sanders/platform_vendor_aosip HEAD:ten2
cd ../..
cd pac*/apps/Settings
git fetch https://github.com/DerpFest-Sanders/platform_packages_apps_Settings face
git cherry-pick 9341795c8b2eb4b292a7f12ccb473c2c47b791e1
#git push -f https://github.com/DerpFest-Sanders/platform_packages_apps_Settings HEAD:ten2
cd ../../..
sleep 3
cd frameworks/base
git fetch https://github.com/DerpFest-Sanders/platform_frameworks_base fp2
git cherry-pick ca87df56b575e3f2f143c250cf27dc3c7b526dce #port faceunlock
git cherry-pick 1337ccd83f6cb62374d211e38de4ddac490ac9d1 #guard some functions
git cherry-pick 455081662cba344ebe7abdec3b7fbe77feda5423 #ls improvement
cd ../..
sleep 2
echo " "
echo " "
rm -rf nine
fi

if [ -e ten ]
then
echo -e "$blue// sepolicy-legacy-um from PE //$nocol"
rm -rf device/qcom/sepolicy-legacy-um
git clone  https://github.com/PixelExperience/device_qcom_sepolicy-legacy-um device/qcom/sepolicy-legacy-um
echo " "
echo " "
rm -rf ten
fi

if [ -e eleven ]
then
echo -e "$blue// Importing USAP Zygote //$nocol"
cd frame*/base
git fetch https://github.com/DerpFest-Sanders/platform_frameworks_base usap
git cherry-pick a0dde10b22d60cc1587be68cb1370039620e5ed0^..a8eedaa2898e8d562b057dbddc1a6b60c55c78f1
#git push -f https://github.com/DerpFest-Sanders/platform_frameworks_base HEAD:ten2
cd ../..
sleep 2
cd system/core
git fetch https://github.com/DerpFest-Sanders/platform_system_core usap
git cherry-pick 01d3e8cfd222f20e83b5778f9fe3887c587023a4
git push -f https://github.com/DerpFest-Sanders/platform_system_core HEAD:ten2
cd ../..
rm -rf eleven
echo " "
echo " "
fi

#if [ -e eleven ]
#then
#echo -e "$blue// Removing RGB accent picker //$nocol"
#cd f*/base
#git fetch https://github.com/DerpFest-Sanders/platform_frameworks_base rmrgb
#git cherry-pick -s d1a43abc879c1f9fb35b4f0dfe7be3dde10ce084^..66b10fc5179e6bd6631c26c9b2a5acff005cccb3
#git push -f https://github.com/DerpFest-Sanders/platform_frameworks_base ten2
#cd ../..
#cd pac*/apps/Derp*
#git fetch https://github.com/DerpFest-Sanders/platform_packages_apps_DerpQuest rmrgb
#git cherry-pick -s 969a6277805edb78c64fb74888c7b336f7201ab0^..3a9ccea03ef0843085ff5405f8624f0639a53028
#git push -f https://github.com/DerpFest-Sanders/platform_packages_apps_DerpQuest HEAD:ten2
#cd ../..
#cd pac*/apps/ThemePicker
#git fetch https://github.com/DerpFest-Sanders/platform_packages_apps_ThemePicker rmrgb
#git cherry-pick -s f836a0c96119210f7ef4b2a1b4110dfa5aabd096
#git push -f https://github.com/DerpFest-Sanders/platform_packages_apps_ThemePicker HEAD:ten2
#cd ../../..
#cd vendor/overlay
#git fetch https://github.com/DerpFest-Sanders/platform_vendor_overlay rmrgb
#git cherry-pick -s 74b2ca1f8e2856cc922b5df28e5d56cfa7d23840
#git push -f https://github.com/DerpFest-Sanders/platform_vendor_overlay HEAD:ten2
#cd ../..
#cd device/aosip/sepolicy
#git fetch https://github.com/DerpFest-Sanders/device_aosip_sepolicy-1 rmrgb
#git cherry-pick -s 30fefa43647c2f9aa06b82d18ff2138fcbbdced9
#git push -f https://github.com/DerpFest-Sanders/device_aosip_sepolicy-1 HEAD:ten2
#cd ../../..
#fi

echo " "
echo -e "$cyan// Picked stuffs from DerpFest-Sanders //$nocol"

. builds*/dp*
