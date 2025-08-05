
import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from difflib import SequenceMatcher

# Download NLTK data files (if not already done)
nltk.download('punkt')
nltk.download('2q')

def compare():
    # Sample texts
    text1 = """
    Natural Language Processing is a field of Artificial Intelligence.
    It focuses on the interaction between computers and humans through language.
    """
    text2 = """
    Natural Language Processing is a branch of AI.
    It deals with the interaction between machines and humans using natural language.
    """
    # Preprocess the texts
    preprocessed_text1 = preprocess_text(text1)
    preprocessed_text2 = preprocess_text(text2)
    
    # Calculate cosine similarity
    similarity_score = calculate_cosine_similarity(preprocessed_text1, preprocessed_text2)

    # Find textual differences
    differences = find_differences(text1, text2)

    # Output the results
    print(f"Cosine Similarity: {similarity_score:.2f}")
    print("Differences:")
    for change in differences:
        print(f"Type: {change[0]}, Text1: '{change[1]}', Text2: '{change[2]}'")


# Function to preprocess text
def preprocess_text(text):
    # Tokenize text
    tokens = word_tokenize(text.lower())
    # Remove stopwords and punctuation
    stop_words = set(stopwords.words('english'))
    filtered_tokens = [word for word in tokens if word.isalnum() and word not in stop_words]
    return ' '.join(filtered_tokens)



# Function to calculate cosine similarity
def calculate_cosine_similarity(text1, text2):
    vectorizer = TfidfVectorizer()
    tfidf_matrix = vectorizer.fit_transform([text1, text2])
    return cosine_similarity(tfidf_matrix[0], tfidf_matrix[1])[0][0]

# Function to find differences using SequenceMatcher
def find_differences(text1, text2):
    matcher = SequenceMatcher(None, text1, text2)
    changes = []
    for tag, i1, i2, j1, j2 in matcher.get_opcodes():
        if tag != 'equal':
            changes.append((tag, text1[i1:i2], text2[j1:j2]))
    return changes

# compare()