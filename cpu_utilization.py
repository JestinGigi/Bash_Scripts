# PRogram to print cpu utilization
import os

output = os.popen('grep cpu /proc/stat').readlines()[0].split()
print(output)

total = 0
for i in range(1, len(output)):
	total += int(output[i])

idle = int(output[4])
cpu = 100 * (total - idle) / total

print(f"CPU Utilization: {cpu}")
