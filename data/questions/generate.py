import json
import os
import uuid

# Generate UUID
question_id = str(uuid.uuid4())

# Create JSON data
question_data = {
    "id": question_id,
    "description": "",
    "images": [],
    "type": "",
    "answer_options": [],
    "explanation": ""
}

# Get question type from user input
question_type = input("Enter question type (1: single_choice, 2: multiple_choice, 3: true_false, 4: fill_in_the_blank): ")
if question_type == "1":
    question_data["type"] = "single_choice"
    question_data["description"] = "Enter question description"
    question_data["answer_options"] = [
        {"option": "A. Option 1", "is_correct": False},
        {"option": "B. Option 2", "is_correct": False},
        {"option": "C. Option 3", "is_correct": False},
        {"option": "D. Option 4", "is_correct": False}
    ]
    question_data["explanation"] = "Enter explanation"
elif question_type == "2":
    question_data["type"] = "multiple_choice"
    question_data["description"] = "Enter question description"
    question_data["answer_options"] = [
        {"option": "A. Option 1", "is_correct": False},
        {"option": "B. Option 2", "is_correct": False},
        {"option": "C. Option 3", "is_correct": False},
        {"option": "D. Option 4", "is_correct": False}
    ]
    question_data["explanation"] = "Enter explanation"
elif question_type == "3":
    question_data["type"] = "true_false"
    question_data["description"] = "Enter question description"
    question_data["answer_options"] = [
        {"option": "True", "is_correct": False},
        {"option": "False", "is_correct": False}
    ]
    question_data["explanation"] = "Enter explanation"
elif question_type == "4":
    question_data["type"] = "fill_in_the_blank"
    question_data["description"] = "Enter question description"
    question_data["answer"] = "enter answer"
    del question_data["answer_options"]
    question_data["explanation"] = "Enter explanation"
else:
    print("Invalid question type.")
    exit()

# Write JSON data to file
filename = f"{question_id}.json"
with open(filename, "w") as f:
    json.dump(question_data, f, indent=4)

# Print file path
print(f"File saved to: {os.path.abspath(filename)}")
print("Please polish the question, including images in images folder, and then move it to the questions/raw folder and submit it via PR.")
