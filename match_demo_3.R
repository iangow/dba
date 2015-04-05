A <- B <- seq(from = 0.01, to = 1, by = 0.01)

df <- as.data.frame(expand.grid(A=A, B=B))
n <- dim(df)[1]

p <- function(a, b) { 
    
    sp <- -2 + 
        3 * (a)       - 3 * (a - .1) +
        2 * (a - .3)  - 2 * (a - .5) + 
        4 * (a - .7)  - 4 * (a - .9) + 
        1 * (b)       - 1 * (b - .1) + 
        2 * (b - .7)  - 2 * (b - .9) +
        3 * (a - .5)      * (b - .5) -
        3 * (a - .7)      * (b - .7)

    return(exp(sp)/(1 + exp(sp)))
}

df$p <- unlist(Map(p, df$A, df$B))
wireframe(p ~ A + B, data = df, shade = TRUE)

gen_data <- function(df) {
    df$y1 <- 100 + 3 * A + 2 * B + rnorm(n, 0, 5)
    df$y2 <- 102 + 6 * A + 4 * B + rnorm(n, 0, 5)
    df$d1 <- rbinom(n, size = 1, prob = df$p)
    df$d2 <- rbinom(n, size = 1, prob = (1-df$p))
    return(df)
}

do_sim <- function(i) {
    df_sim <- gen_data(df)
    n <- sum(df_sim$d1==1) + sum(df_sim$d2==1)
    no_control <- sum(df_sim$d2==0)
    no_treat <- sum(df_sim$d1==0)
    att <- with(df_sim, mean((y2 - y1)[d1==1]))
    atc <- with(df_sim, mean((y2 - y1)[d2==1]))
    ate <- with(df_sim, mean(y2 - y1))
    return(data.frame(i, n, no_control, no_treat, att, atc, ate))
}

library("parallel")
k <- 50000
results <- do.call("rbind", mclapply(1:k, do_sim, mc.cores=8))
