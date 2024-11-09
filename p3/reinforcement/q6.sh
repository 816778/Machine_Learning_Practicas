#!/bin/bash

output_file="results.txt"
echo "Epsilon, Learning Rate, Average Return" > "$output_file"


# Define the possible values for -e and -l
epsilons=(0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0)
learning_rates=(0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0)

output_file="results.txt"
echo "Epsilon, Learning Rate, Average Return" > "$output_file"

# Iterar sobre todas las combinaciones de epsilon y learning rate
for epsilon in "${epsilons[@]}"; do
  for learning_rate in "${learning_rates[@]}"; do
    # Ejecutar el comando con la combinación actual de epsilon y learning rate y guardar el resultado
    echo "Running with -e $epsilon and -l $learning_rate"
    average_return=$(python gridworld.py -a q -k 1000 -g BridgeGrid -e "$epsilon" -l "$learning_rate" -q| grep "AVERAGE RETURNS FROM START STATE" | awk '{print $NF}')
    echo "$epsilon, $learning_rate, $average_return" >> "$output_file"
  done
done