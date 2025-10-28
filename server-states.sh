#!/bin/bash
# simple server state script:
echo "=== QUICK SERVER STATS ==="
cpu_usage=$(top -bn1 | grep "cpu(s)" | awk '{print $2}' | cut -d'$' -f1) 
echo "CPU_usage = ${cpu_usage}%"
mem_total=$(free -m | awk 'NR==2{print $2}')
mem_used=$(free -m | awk 'NR==2{print $3}')
mem_percent=$(( mem_used * 100 / mem_total))
echo "Memory_usage => 1.Total= ${mem_total}MB/ 2.Used=${mem_used}MB 3.In_percentage= ${mem_percent}%"
disk_total=$(df -h | awk 'NR==2{print $2}')
disk_used=$(df -h | awk 'NR==2{print $3}')
disk_free=$(df -h | awk 'NR==2{print $4}')
disk_percent=$(df -h | awk 'NR==2{print $5}')
echo "Disk_usage => 1.Total= ${disk_total}G/ 2.Used= ${disk_used}G/ 3.Free = ${disk_free}G/ 4.Percentage= ${disk_percent}"
echo "Top 5 processes CPU:"
ps aux --sort=-%cpu | head -6 | tail -5 | awk '{print $3"%", $11}'
echo "Top 5 processes Memory"
ps aux --sort=-%mem | head -6 | tail -5 | awk '{print $4"%", $11}'
