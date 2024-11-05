<<<<<<< HEAD

# Virtual gene function
gene_dna <- function(length, base_probs = c(0.25, 0.25, 0.25, 0.25)){
  if(length %% 3 != 0) {
    stop("The argument to the parameter 'length' has to be divisible by 3")
  }
  if(abs(sum(base_probs) - 1) > 1e-10) {
    stop("Error: Probabilities do not sum to 1 ")
=======
# Define the "Virtual Gene"-function (See code for functions above)
gene_dna <- function(length, base_probs){
  if( length %% 3 != 0 ){
    stop("The argument to the parameter 'l' has to be divisible by 3")
  }
  if (sum(base_probs) != 1){
    stop("The total sum of probabilities must sum up to 1")
>>>>>>> 41de1c7f3fdc0d8b5ca9b8a37dc5629bdec386da
  }
  dna_vector <- sample(
    x = c("A", "T", "C", "G"),
    size = length,
    replace = TRUE,
<<<<<<< HEAD
    prob = base_probs
  )
  dna_string <- paste0(
    x = dna_vector,
    collapse = ""
  )
=======
    prob = base_probs)
  dna_string <- paste0(
    x = dna_vector,
    collapse = "")
>>>>>>> 41de1c7f3fdc0d8b5ca9b8a37dc5629bdec386da
  return(dna_string)
}


<<<<<<< HEAD

=======
>>>>>>> 41de1c7f3fdc0d8b5ca9b8a37dc5629bdec386da
# Virtual RNA polymerase
transcribe_dna <- function(dna){
  rna <- gsub(
    pattern = "T",
    replacement = "U",
    x = dna)
  return(rna)
}


<<<<<<< HEAD

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
=======
# Virtual Ribosome
translate_rna <- function(rna){
  if( is.null(rna) || rna == "" ){ return("") }
  l <- nchar(x = rna)
  firsts <- seq(
    from = 1,
    to = l,
    by = 3)
  lasts <- seq(
    from = 3,
    to = l,
    by = 3)
  codons <- substring(
    text = rna,
    first = firsts,
    last = lasts)
  codon_table <- c(
    "UUU" = "F", "UCU" = "S", "UAU" = "Y", "UGU" = "C",
    "UUC" = "F", "UCC" = "S", "UAC" = "Y", "UGC" = "C",
    "UUA" = "L", "UCA" = "S", "UAA" = "_", "UGA" = "_",
    "UUG" = "L", "UCG" = "S", "UAG" = "_", "UGG" = "W",
>>>>>>> 41de1c7f3fdc0d8b5ca9b8a37dc5629bdec386da
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
<<<<<<< HEAD
    "GUG" = "V", "GCG" = "A", "GAG" = "E", "GGG" = "G"
  )

  protein <- paste0(x = codon_table[codons], collapse = "")
=======
    "GUG" = "V", "GCG" = "A", "GAG" = "E", "GGG" = "G")
  protein <- paste0(
    x = codon_table[codons],
    collapse = "")
>>>>>>> 41de1c7f3fdc0d8b5ca9b8a37dc5629bdec386da
  return(protein)
}


<<<<<<< HEAD
=======

# Simple base counts
base_freqs <- function(dna){
  if (is.null(dna) || dna == "" ){
    return( data.frame(dna_vec = factor(c("A", "C", "G", "T")),
                       Freq = c(0, 0, 0, 0)) ) }
  dna_vec <- strsplit(x = dna,
                      split = "")
  base_counts <- table(dna_vec)
  return( as.data.frame.table(base_counts) )
}
>>>>>>> 41de1c7f3fdc0d8b5ca9b8a37dc5629bdec386da
