def pdfreader(path):
    import re
    import fitz


    # Open the PDF file in read-binary mode
    with open(path, 'rb') as pdf_file:
        # Create a PyPDF2 PdfReader object
        pdf_reader = fitz.open(pdf_file)

        # Get the number of pages in the PDF file
        num_pages = pdf_reader.page_count

        # Iterate through all the pages and extract the text
        text = ''
        for page_num in range(num_pages):
            page = pdf_reader.load_page(page_num)
            page_text = page.get_text()
            text += page_text

    # print(text)
    resume_text = text.replace("'", "''")
    return resume_text


