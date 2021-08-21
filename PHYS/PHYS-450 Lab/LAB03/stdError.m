function Value = stdError(A)
Value = [mean(A) std(A)/sqrt(length(A))];