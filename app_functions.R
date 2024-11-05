# Virtual gene function
gene_dna <- function(length, base_probs = c(0.25, 0.25, 0.25, 0.25)){
  if(length %% 3 != 0) {
    stop("The argument to the parameter 'length' has to be divisible by 3")
  }
  if(abs(sum(base_probs) - 1) > 1e-10) {
    stop("Error: Probabilities do not sum to 1 ")
  }
  dna_vector <- sample(
    x = c("A", "T", "C", "G"),
    size = length,
    replace = TRUE,
    prob = base_probs
  )
  dna_string <- paste0(
    x = dna_vector,
    collapse = ""
  )
  return(dna_string)
}



# Virtual RNA polymerase
transcribe_dna <- function(dna){
  rna <- gsub(
    pattern = "T",
    replacement = "U",
    x = dna)
  return(rna)
}



# Virtual Ribosome
translate_rna <- function(rna) {
  # Check if the RNA sequence length is divisible by 3
  if (nchar(rna) %% 3 != 0) {
    return("Error: The RNA sequence length must be a multiple of 3 for proper translation. Please check the sequence and try again.")
  }

  # Proceed with translation if length is valid
  if (is.null(rna) || rna == "") { return("") }

  l <- nchar(x = rna)
  firsts <- seq(from = 1, to = l, by = 3)
  lasts <- seq(from = 3, to = l, by = 3)

  codons <- substring(text = rna, first = firsts, last = lasts)
  codon_table <- c(
    "UUU" = "F", "UCU" = "S", "UAU" = "Y", "UGU" = "C",
    "UUC" = "F", "UCC" = "S", "UAC" = "Y", "UGC" = "C",
    "UUA" = "L", "UCA" = "S", "UAA" = "-STOP", "UGA" = "-STOP",
    "UUG" = "L", "UCG" = "S", "UAG" = "-STOP", "UGG" = "W",
    "CUU" = "L", "CCU" = "P", "CAU" = "H", "CGU" = "R",
    "CUC" = "L", "CCC" = "P", "CAC" = "H", "CGC" = "R",
    "CUA" = "L", "CCA" = "P", "CAA" = "Q", "CGA" = "R",
    "CUG" = "L", "CCG" = "P", "CAG" = "Q", "CGG" = "R",
    "AUU" = "I", "ACU" = "T", "AAU" = "N", "AGU" = "S",
    "AUC" = "I", "ACC" = "T", "AAC" = "N", "AGC" = "S",
    "AUA" = "I", "ACA" = "T", "AAA" = "K", "AGA" = "R",
    "AUG" = "M", "ACG" = "T", "AAG" = "K", "AGG" = "R",
    "GUU" = "V", "GCU" = "A", "GAU" = "D", "GGU" = "G",
    "GUC" = "V", "GCC" = "A", "GAC" = "D", "GGC" = "G",
    "GUA" = "V", "GCA" = "A", "GAA" = "E", "GGA" = "G",
    "GUG" = "V", "GCG" = "A", "GAG" = "E", "GGG" = "G"
  )

  protein <- paste0(x = codon_table[codons], collapse = "")
  return(protein)
}
