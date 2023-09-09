# read what is in this file and than write the opposite

# 0 - off
# 1 - on

# if no argument is given, print the current state

if [ $# -eq 0 ]
then
    cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
    exit 0
fi

# if argument is given, write the opposite

if [ $1 -eq 1 ]
then
    echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
    exit 0
fi

if [ $1 -eq 0 ]
then
    echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
    exit 0
fi


