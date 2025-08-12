Google Maps Fake Review Detector is a web-based project designed to detect fake Arabic reviews on Google Maps. It leverages an LSTM model and sentiment analysis alongside a rule-based algorithm for data labeling.

Key Features:

Automatic data collection from Google Maps via Outscraper API.

Arabic text preprocessing (removing symbols, diacritics, and stop words).

Data labeling based on review length, rating, and sentiment analysis.

Use of padding and word embedding to prepare text for model training.

Recalculation of ratings after removing fake reviews.

Interactive web interface built with ASP.NET and JavaScript, backed by MS SQL Server.

Integrated AI Techniques:

LSTM (Long Short-Term Memory): For processing sequential text and analyzing long-term context in reviews.

Sentiment Analysis using NLTK & VADER: For detecting positive/negative/neutral sentiment and analyzing exaggeration or bias.

Rule-Based Classification: Combining predefined rules with AI to improve classification accuracy.
