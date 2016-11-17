### Code for CPE782  - Independent Component Analysis (Master at COPPE/UFRJ)

The discipline is divided in three parts:

1. Generating mixed signals from sources of types random variables, images and audio.
(each student is responsible for one type of data, I was responsible for rv)

After that the idea is to recover original sources from mixed signals using ICA, but no student has the original sources, only the mixture.
(each student is responsible for one ICA algorithm, I was responsible for Jade).

2. Recover original sources with Jade.
We're not able to say that algorithm worked because without the sources it's not possible to tell the original sources were recovered.
But we can explore other results:
- Sources were really recovered? Mutual information between mixed signals should be way bigger than the estimated sources after ICA, indicating that if the true sources we not exactly recovered we should be at least close.

Now each student should receive original sources and answer if ICA algorithms successfully recovered them.
(the code for this part is not here in the repository, I have to organize it first)

3. Original sources are the same as recovered sources?
- We should compare original source and recovered source PDFs with KL divergence and conclude if they are close or not. But that's not an easy task, see my answer here: http://stats.stackexchange.com/questions/245526/comparing-two-pdfs-using-kullback-leibler-divergence/245593#245593
