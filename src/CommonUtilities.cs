using StopWord;

namespace WW_GPT.Common
{
    public class CommonUtilities
    {
        public static string RemoveStopWords(string input)
        {
            string[] stopWords = { "really", "sometimes", "go", "since", "whither", "they", "its", "them", "well", "meanwhile",
                      "seems", "and", "latterly", "regarding", "somehow", "sixty", "whole", "anyway", "else", "few",
                      "'m", "beside", "to", "namely", "someone", "see", "moreover", "wherein", "for", "former",
                      "bottom", "it", "next", "six", "along", "once", "might", "whenever", "below", "another",
                      "yourself", "each", "just", "ourselves", "everyone", "any", "across", "get", "that", "eight",
                      "we", "which", "therefore", "may", "'s", "keep", "among", "give", "such", "are", "indeed",
                      "everywhere", "same", "herself", "yourselves", "alone", "were", "was", "take", "seem", "say",
                      "why", "show", "between", "during", "elsewhere", "or", "though", "forty", "made", "used",
                      "others", "whereafter", "formerly", "several", "via", "does", "please", "three", "also",
                      "fifty", "afterwards", "'s", "noone", "do", "perhaps", "further", "i", "beforehand", "myself",
                      "empty", "'ll", "yet", "thereby", "been", "both", "never", "put", "without", "him", "a",
                      "nothing", "thereafter", "make", "then", "whom", "must", "sometime", "against", "through",
                      "being", "four", "back", "become", "our", "himself", "because", "anything", "'re", "nor",
                      "therein", "due", "until", "own", "ca", "most", "now", "while", "of", "only", "am", "itself",
                      "too", "'m", "nobody", "if", "one", "whereas", "twelve", "together", "can", "who", "even",
                      "be", "she", "besides", "herein", "off", "'d", "last", "no", "whereupon", "the", "'m", "thru",
                      "out", "hereupon", "by", "us", "already", "became", "here", "hers", "onto", "beyond", "down",
                      "enough", "did", "some", "over", "serious", "quite", "move", "around", "nowhere", "amongst",
                      "but", "so", "wherever", "twenty", "often", "part", "again", "where", "re", "within", "at",
                      "n't", "yours", "front", "unless", "could", "anyone", "third", "whatever", "doing", "'d",
                      "nevertheless", "before", "rather", "fifteen", "her", "me", "thereupon", "mostly", "throughout",
                      "hence", "'re", "mine", "ten", "hundred", "nine", "call", "when", "about", "will", "whereby",
                      "this", "upon", "you", "should", "always", "themselves", "not", "has", "behind", "on",
                      "anywhere", "side", "their", "hereby", "latter", "after", "'ve", "none", "these", "name",
                      "n't", "every", "although", "'s", "however", "he", "becoming", "how", "whose", "still",
                      "hereafter", "whether", "towards", "more", "everything", "whoever", "seemed", "cannot", "up",
                      "otherwise", "in", "would", "under", "done", "thence", "whence", "seeming", "either", "other",
                      "with", "into", "amount", "five", "much", "'re", "except", "his", "thus", "'ll", "what",
                      "almost", "becomes", "least", "ever", "above", "is", "first", "there", "somewhere", "top",
                      "'ve", "'ve", "than", "n't", "have", "toward", "per", "all", "ours", "full", "'d", "anyhow",
                      "as", "'ll", "many", "various", "your", "had", "eleven", "from", "something", "less", "those",
                      "using", "an", "two", "my", "very", "neither", "refers" };


            // Split the string into individual words
            string[] words = input.ToLower().Split(new[] { ' ', ',', '.', ';', ':' }, StringSplitOptions.RemoveEmptyEntries);

            // Remove stop words from the array
            words = words.Where(word => !stopWords.Contains(word.ToLower())).ToArray();

            // Join the remaining words back into a string
            string result = string.Join(" ", words);
            return result;
        }
    }
}
