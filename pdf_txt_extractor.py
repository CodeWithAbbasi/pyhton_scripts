import fitz


# --- Step 1: Define the file paths ---
pdf_file = "document.pdf"
text_file = "extracted_text.txt"
# --- Step 2: Open the PDF and get its content ---

# The 'with' statement ensures the file is closed automatically
with fitz.open(pdf_file) as pdf_document:
    # An empty string to hold all the text we extract
    all_text = ""

    # --- Step 3: Loop through each page ---
    for page_number in range(pdf_document.page_count):
        # Get a specific page
        page = pdf_document.load_page(page_number)
        
        # Extract the text from the page
        text = page.get_text()
        
        # Add the extracted text to our main string
        all_text += text

# --- Step 4: Save the text to a new file ---
with open(text_file, "w", encoding="utf-8") as output_file:
    output_file.write(all_text)


print(f"Text has been successfully extracted from '{pdf_file}' and saved to '{text_file}'.")
