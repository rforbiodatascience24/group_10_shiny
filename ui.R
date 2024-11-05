

# Combined User Interface with Tabs
ui <- fluidPage(
  titlePanel("Virtual Central Dogma Tools"),

  tabsetPanel(

    # Tab 1: Virtual Gene Generator
    tabPanel(
      "Virtual Gene Generator",
      layout_columns(
        col_widths = 12,
        card(
          titlePanel("Virtual Gene Generator Overview"),
          helpText("This application simulates a virtual DNA sequence, allowing you to visualize the central dogma of molecular biology by generating random DNA sequences based on custom probabilities for each base (A, T, C, and G).
                   To use the app:
                     1) Select the total number of DNA bases using the 'Number of bases' slider.
          - Note: The number of bases must be divisible by 3 to simulate codons accurately.
          2) Adjust the probabilities for each base (A, T, C, and G) using the input fields provided.
        - Ensure that the sum of all probabilities adds up to 1; otherwise, the sequence generation will not work.
        Once you've set the desired parameters, the app will display a randomly generated DNA sequence in the output panel below. This sequence represents a virtual gene based on the probability distributions you've specified for each base.")
        )),
      layout_columns(
        col_widths = 12,
        card(
          card_header("Generate DNA Sequence"),
          sliderInput(inputId = "n_bases",
                      label = "Number of bases:",
                      min = 1,
                      max = 60,
                      value = 30,
                      width = "100%"),
          layout_columns(
            col_widths = c(3, 3, 3, 3),
            numericInput(inputId = "prob_A",
                         label = "Probability of A",
                         value = 0.25,
                         min = 0,
                         max = 1,
                         step = 0.1),
            numericInput(inputId = "prob_T",
                         label = "Probability of T",
                         value = 0.25,
                         min = 0,
                         max = 1,
                         step = 0.1),
            numericInput(inputId = "prob_C",
                         label = "Probability of C",
                         value = 0.25,
                         min = 0,
                         max = 1,
                         step = 0.1),
            numericInput(inputId = "prob_G",
                         label = "Probability of G",
                         value = 0.25,
                         min = 0,
                         max = 1,
                         step = 0.1)
          )
        )
      ),
      layout_columns(
        col_widths = 12,
        card(
          card_header("Generated DNA Sequence"),
          mainPanel(
            verbatimTextOutput(outputId = "dna")
          )
        )
      )
    ),

    # Tab 2: DNA to RNA Transcription Tool
    tabPanel(
      "DNA to RNA Transcription Tool",
      sidebarLayout(
        sidebarPanel(
          textInput(inputId = "dna_sequence",
                    label = "Enter DNA Sequence:",
                    value = "ATGCGTACGTTAG"),
          submitButton("Transcribe to RNA")
        ),
        mainPanel(
          textOutput(outputId = "rna_sequence")
        )
      )
    ),

    # Tab 3: RNA to Protein Translation Tool
    tabPanel(
      "RNA to Protein Translation Tool",
      sidebarLayout(
        sidebarPanel(
          textInput(inputId = "rna_sequence",
                    label = "Enter RNA Sequence:",
                    value = "AUGGCCUAA"),
          submitButton("Translate to Protein")
        ),
        mainPanel(
          textOutput(outputId = "protein_sequence")
        )
      )
    )
  )
)

