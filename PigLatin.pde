public void setup()
{
	String[] lines = loadStrings("LowellHymn.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++)
	{
		for (int j = 0; j < lines[i].split(" ").length; j++)
		{
			System.out.print(pigLatin(lines[i].split(" ")[j]) + " ");
		}
		System.out.println();
	}
}

public void draw() {}

public boolean isVowel(char vChar) { return vChar == 'a' || vChar == 'e' || vChar == 'i' || vChar == 'o' || vChar == 'u'; }
public char isPunctuation(char vChar) { return vChar == '.' ? '.' : vChar == ',' ? ',' : vChar == ';' ? ';' : ' '; }

public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	for (int i=0; i < sWord.length(); i++)
	{
		if (isVowel(sWord.toLowerCase().charAt(i)))
		{
			return i;
		}
	}

	return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if (sWord.equals("") || sWord.equals(" "))
	{
		return "";
	}
	int firstVowel = findFirstVowel(sWord);
	String convertedWord;
	switch (firstVowel)
	{
	case -1:
		convertedWord = sWord + "ay";
		break;
	case 0:
		convertedWord = sWord + "way";
		break;
	default:
		if (sWord.substring(0, 2).equals("qu"))
		{
			convertedWord = sWord.substring(2) + "qu" + "ay";
		}
		else
		{
			convertedWord = sWord.substring(firstVowel) + sWord.substring(0, firstVowel) + "ay";
		}

		convertedWord = convertedWord.toLowerCase();
		if (Character.isUpperCase(sWord.charAt(0)))
		{
			convertedWord = convertedWord.substring(0, 1).toUpperCase() + convertedWord.substring(1);
		}

		char punctuationCharacter = isPunctuation(sWord.charAt(sWord.length()-1));
		if (punctuationCharacter != ' ')
		{
			convertedWord = convertedWord.substring(0, convertedWord.indexOf(punctuationCharacter)) + convertedWord.substring(convertedWord.indexOf(punctuationCharacter)+1) + punctuationCharacter;
		}
		break;
	}

	return convertedWord;
}
