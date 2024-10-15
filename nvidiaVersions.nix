{ lib }:
let
  # collected from https://download.nvidia.com/XFree86/Linux-x86_64 by running
  # ```
  # copy(
  #   $$('a')
  #     .map(e => e.innerText)
  #     .filter(e => e.match(/[0-9]/))
  #     .map(e => e.substring(0, e.length-1))
  #     .map(s => `"${s}"`)
  #     .join("\n")
  # )
  # ```
  existingVersions = [
    "71.86.01"
    "71.86.04"
    "71.86.07"
    "71.86.08"
    "71.86.09"
    "71.86.10"
    "71.86.11"
    "71.86.13"
    "71.86.14"
    "71.86.15"
    "96.43.01"
    "96.43.05"
    "96.43.09"
    "96.43.10"
    "96.43.11"
    "96.43.12"
    "96.43.13"
    "96.43.14"
    "96.43.16"
    "96.43.17"
    "96.43.18"
    "96.43.19"
    "96.43.20"
    "96.43.23"
    "100.14.03"
    "100.14.06"
    "100.14.09"
    "100.14.11"
    "100.14.19"
    "100.14.23"
    "165.33.09"
    "169.04"
    "169.07"
    "169.09"
    "169.12"
    "171.05"
    "171.06"
    "171.06.01"
    "173.08"
    "173.14.05"
    "173.14.12"
    "173.14.15"
    "173.14.16"
    "173.14.17"
    "173.14.18"
    "173.14.19"
    "173.14.20"
    "173.14.22"
    "173.14.25"
    "173.14.27"
    "173.14.28"
    "173.14.30"
    "173.14.31"
    "173.14.34"
    "173.14.35"
    "173.14.36"
    "173.14.37"
    "173.14.38"
    "173.14.39"
    "177.61.02"
    "177.67"
    "177.68"
    "177.70"
    "177.76"
    "177.78"
    "177.80"
    "177.82"
    "180.06"
    "180.08"
    "180.11"
    "180.11.02"
    "180.16"
    "180.18"
    "180.22"
    "180.25"
    "180.27"
    "180.29"
    "180.35"
    "180.37"
    "180.37.05"
    "180.41"
    "180.44"
    "180.50"
    "180.51"
    "180.53"
    "180.60"
    "185.13"
    "185.18.04"
    "185.18.08"
    "185.18.10"
    "185.18.14"
    "185.18.29"
    "185.18.31"
    "185.18.36"
    "185.19"
    "190.18"
    "190.18.05"
    "190.25"
    "190.32"
    "190.36"
    "190.40"
    "190.42"
    "190.53"
    "195.22"
    "195.30"
    "195.36.15"
    "195.36.24"
    "195.36.31"
    "256.25"
    "256.29"
    "256.35"
    "256.38.02"
    "256.38.03"
    "256.44"
    "256.52"
    "256.53"
    "260.19.04"
    "260.19.06"
    "260.19.12"
    "260.19.21"
    "260.19.26"
    "260.19.29"
    "260.19.36"
    "260.19.44"
    "270.18"
    "270.26"
    "270.29"
    "270.30"
    "270.41.03"
    "270.41.06"
    "270.41.19"
    "275.09"
    "275.09.04"
    "275.09.07"
    "275.19"
    "275.21"
    "275.28"
    "275.36"
    "275.43"
    "280.04"
    "280.11"
    "280.13"
    "285.03"
    "285.05.09"
    "290.03"
    "290.06"
    "290.10"
    "295.09"
    "295.17"
    "295.20"
    "295.33"
    "295.40"
    "295.49"
    "295.53"
    "295.59"
    "295.71"
    "295.75"
    "302.07"
    "302.11"
    "302.17"
    "304.22"
    "304.30"
    "304.32"
    "304.37"
    "304.43"
    "304.48"
    "304.51"
    "304.60"
    "304.64"
    "304.84"
    "304.88"
    "304.108"
    "304.116"
    "304.117"
    "304.119"
    "304.121"
    "304.123"
    "304.125"
    "304.128"
    "304.131"
    "304.132"
    "304.134"
    "304.135"
    "304.137"
    "310.14"
    "310.19"
    "310.32"
    "310.40"
    "310.44"
    "310.51"
    "313.09"
    "313.18"
    "313.26"
    "313.30"
    "319.12"
    "319.17"
    "319.23"
    "319.32"
    "319.49"
    "319.60"
    "319.72"
    "319.82"
    "325.08"
    "325.15"
    "331.13"
    "331.17"
    "331.20"
    "331.38"
    "331.49"
    "331.67"
    "331.79"
    "331.89"
    "331.104"
    "331.113"
    "334.16"
    "334.21"
    "337.12"
    "337.19"
    "337.25"
    "340.17"
    "340.24"
    "340.32"
    "340.46"
    "340.58"
    "340.65"
    "340.76"
    "340.93"
    "340.96"
    "340.98"
    "340.101"
    "340.102"
    "340.104"
    "340.106"
    "340.107"
    "340.108"
    "343.13"
    "343.22"
    "343.36"
    "346.16"
    "346.22"
    "346.35"
    "346.47"
    "346.59"
    "346.72"
    "346.82"
    "346.87"
    "346.96"
    "349.12"
    "349.16"
    "352.09"
    "352.21"
    "352.30"
    "352.41"
    "352.55"
    "352.63"
    "352.79"
    "355.06"
    "355.11"
    "358.09"
    "358.16"
    "361.16"
    "361.18"
    "361.28"
    "361.42"
    "361.45.11"
    "361.45.18"
    "364.12"
    "364.15"
    "364.19"
    "367.18"
    "367.27"
    "367.35"
    "367.44"
    "367.57"
    "370.23"
    "370.28"
    "375.10"
    "375.20"
    "375.26"
    "375.39"
    "375.66"
    "375.82"
    "378.09"
    "378.13"
    "381.09"
    "381.22"
    "384.47"
    "384.59"
    "384.69"
    "384.90"
    "384.98"
    "384.111"
    "384.130"
    "387.12"
    "387.22"
    "387.34"
    "390.12"
    "390.25"
    "390.42"
    "390.48"
    "390.59"
    "390.67"
    "390.77"
    "390.87"
    "390.116"
    "390.129"
    "390.132"
    "390.138"
    "390.141"
    "390.143"
    "390.144"
    "390.147"
    "390.151"
    "390.154"
    "390.157"
    "396.18"
    "396.24"
    "396.45"
    "396.51"
    "396.54"
    "410.57"
    "410.66"
    "410.73"
    "410.78"
    "410.93"
    "410.104"
    "415.13"
    "415.18"
    "415.22"
    "415.23"
    "415.25"
    "415.27"
    "418.30"
    "418.43"
    "418.56"
    "418.74"
    "418.88"
    "418.113"
    "430.09"
    "430.14"
    "430.26"
    "430.34"
    "430.40"
    "430.50"
    "430.64"
    "435.17"
    "435.21"
    "440.26"
    "440.31"
    "440.36"
    "440.44"
    "440.59"
    "440.64"
    "440.82"
    "440.100"
    "450.51"
    "450.57"
    "450.66"
    "450.80.02"
    "450.102.04"
    "450.119.03"
    "455.23.04"
    "455.28"
    "455.38"
    "455.45.01"
    "460.27.04"
    "460.32.03"
    "460.39"
    "460.56"
    "460.67"
    "460.73.01"
    "460.80"
    "460.84"
    "460.91.03"
    "465.19.01"
    "465.24.02"
    "465.27"
    "465.31"
    "470.42.01"
    "470.57.02"
    "470.63.01"
    "470.74"
    "470.82.00"
    "470.82.01"
    "470.86"
    "470.94"
    "470.103.01"
    "470.129.06"
    "470.141.03"
    "470.161.03"
    "470.182.03"
    "470.199.02"
    "470.223.02"
    "470.239.06"
    "470.256.02"
    "495.29.05"
    "495.44"
    "495.46"
    "510.39.01"
    "510.47.03"
    "510.54"
    "510.60.02"
    "510.68.02"
    "510.73.05"
    "510.85.02"
    "510.108.03"
    "515.43.04"
    "515.48.07"
    "515.57"
    "515.65.01"
    "515.76"
    "515.86.01"
    "515.105.01"
    "520.56.06"
    "525.53"
    "525.60.11"
    "525.60.13"
    "525.78.01"
    "525.85.05"
    "525.89.02"
    "525.105.17"
    "525.116.03"
    "525.116.04"
    "525.125.06"
    "525.147.05"
    "530.30.02"
    "530.41.03"
    "535.43.02"
    "535.54.03"
    "535.86.05"
    "535.98"
    "535.104.05"
    "535.113.01"
    "535.129.03"
    "535.146.02"
    "535.154.05"
    "535.161.07"
    "535.171.04"
    "535.179"
    "535.183.01"
    "545.23.06"
    "545.29.02"
    "545.29.06"
    "550.40.07"
    "550.54.14"
    "550.67"
    "550.76"
    "550.78"
    "550.90.07"
    "550.100"
    "550.107.02"
    "550.120"
    "555.42.02"
    "555.52.04"
    "555.58"
    "555.58.02"
    "560.28.03"
    "560.31.02"
    "560.35.03"
  ];
  # We match for the leading [1-9] because our nixpkgs dependency doesn't yet have toIntBase10
  # so version numbers like 06 are interpreted as octals and raise errors
  splitToNums = a: builtins.map lib.toInt (lib.flatten (builtins.filter builtins.isList (builtins.split "([1-9][0-9]+)" a)));
  lexLeq = a: b:
    let
      dfs = lib.lists.zipListsWith (a: b: a - b) (splitToNums a) (splitToNums b);
    in
    (lib.findFirst (a: a != 0) 0 dfs) <= 0;
in
version: lib.findFirst (lexLeq version) (throw "unable to match version to an existing driver") existingVersions
