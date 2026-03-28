#!/bin/bash

# ALIAS DEMONSTRATION (Commented as per requirements):
# In a real environment, you could create an alias for this script in ~/.bashrc:
# alias myaudit='./philosophy_gen.sh'
# This would allow the auditor to run their personalized statement generator 
# with a single short command.

echo "========================================================"
echo "      OPEN SOURCE PHILOSOPHY STATEMENT GENERATOR       "
echo "========================================================"
echo ""

# 1. Using 'read' for interactive user input
echo "Step 1: What is your primary motivation for using Open Source?"
read -p "> (e.g., Freedom, Cost, Learning): " MOTIVATION

echo ""
echo "Step 2: Which 'Giant's shoulders' are you standing on today?"
read -p "> (e.g., Linus Torvalds, Richard Stallman, Ada Lovelace): " GIANT

echo ""
echo "Step 3: What is the most important 'Freedom' to you?"
read -p "> (e.g., To study the code, To share with others): " FREEDOM

# 2. Using String Concatenation and the 'date' command
CURRENT_DATE=$(date "+%B %d, %Y")
FILENAME="philosophy_statement.txt"

# 3. Composing the paragraph and writing to a file using '>'
# The '>' operator creates/overwrites the file with the new content
echo "Generating your statement..."

echo "OPEN SOURCE PHILOSOPHY STATEMENT" > $FILENAME
echo "--------------------------------" >> $FILENAME
echo "Date: $CURRENT_DATE" >> $FILENAME
echo "" >> $FILENAME
echo "As an auditor in the Open Source ecosystem, my work is driven by $MOTIVATION." >> $FILENAME
echo "I acknowledge that I am standing on the shoulders of $GIANT, whose contributions" >> $FILENAME
echo "made this audit possible. To me, the most vital aspect of software is the freedom" >> $FILENAME
echo "$FREEDOM, ensuring that technology remains a public utility for all." >> $FILENAME

echo ""
echo "SUCCESS: Your personalized statement has been saved to $FILENAME"
echo "========================================================"
