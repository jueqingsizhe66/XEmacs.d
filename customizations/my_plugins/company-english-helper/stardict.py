from pystardict import Dictionary
import os
import sys
import codecs

if __name__ == "__main__":
    if len(sys.argv) <= 1:
        print("Usage: ./stardict.py start_dict_ifo_file_path")
    else:
        start_dictionary = Dictionary(sys.argv[1].split(".ifo")[0])

        f = codecs.open("company-english-helper-data.el","w","utf-8")
        f.write(";; -*- mode: fundamental; -*-\n")
        f.write(";;\n")
        f.write(";; This file is generate by stardict.py, please don't edit this file.\n")
        f.write(";;\n\n")
        f.write("(defconst english-helper-completions\n  '(\n")

        index = 0
        for word in start_dictionary.keys():
            is_english_word = all(ord(char) < 128 for char in word)
            if is_english_word:
                first_line_translation = start_dictionary.dict[word].split()[0]
                no_phonetic_translation = first_line_translation.split(">")[-1]

                candiate_word  = word.lower().replace('\"', ' ')
                candiate_translateion = no_phonetic_translation.strip().replace('\"', ' ')
                f.write('    #(\"'  + candiate_word + '\" ' + '0 1' + '\n' +
                     '      (:initials \"' + candiate_translateion  + '\"))\n')

                print(index, candiate_word, candiate_translateion)
                index += 1

        f.write("    ))\n\n")
        f.write("(provide 'company-english-helper-data)\n")
