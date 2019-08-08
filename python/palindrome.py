punctuation = ('.', '?', '!', ':', ';', '-', '_', '(', ')', '[', ']', "'", '"', '/', ',')

def clean_text(text):
    new_text = text.lower().lstrip()
    for dot in punctuation:
        new_text = new_text.replace(dot, '')
    return new_text

def reverse(text):
    return text[::-1]

def is_palindrome(text):
    cleaned = clean_text(text)
    return cleaned == reverse(cleaned)


text = input('Type a word: ')
if (is_palindrome(text)):
    print('YES! It is palindrome')
else:
    print('no.. its not...')
