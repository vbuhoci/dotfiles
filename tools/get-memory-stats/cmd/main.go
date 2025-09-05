package main

import (
    "fmt"

    "github.com/shirou/gopsutil/v3/mem"
)

func main() {
    v, _ := mem.VirtualMemory()
		
		gbFactor := 1.0 / 1024 / 1024 / 1024

		totalMem := float64(v.Total) * gbFactor
		availMem := float64(v.Available) * gbFactor
		usedMem := float64(v.Used) * gbFactor
		usedMemPct := v.UsedPercent

		fmt.Printf("Total memory: %v\nAvailable memory: %v\nUsed memory: %v\nUsed memory percentage: %.2f%%\n", totalMem, availMem, usedMem, usedMemPct)
		fmt.Printf("\n** Data may not be accurate.\n")
}

