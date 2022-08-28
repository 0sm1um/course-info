import numpy as np
import pandas as pd
import graphviz
import matplotlib.pyplot as plt

from sklearn.model_selection import train_test_split

from sklearn.neighbors import KNeighborsClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC
from sklearn.tree import DecisionTreeClassifier
from sklearn import tree
from sklearn.decomposition import PCA

data = pd.read_csv('C:/Users/echo4/Class/STAT/STAT-636 Machine Learning Algorithms/Project/tic-tac-toe-endgame.csv')

'''
This block of code preprocesses the data. V1 through V9 are the board
locations. V10 is the sucsess or failure for the X player to win.'''
def onehot_encode(df, columns):
    df = df.copy()
    for column in columns:
        dummies = pd.get_dummies(df[column], prefix=column)
        df = pd.concat([df, dummies], axis=1)
        df = df.drop(column, axis=1)
    return df
def preprocess_inputs(df, trn_data):
    df = df.copy()
    # Encode label values as numbers
    df['V10'] = df['V10'].replace({'negative': 0, 'positive': 1})
    # One-hot encode board space columns
    df = onehot_encode(
        df,
        columns=['V' + str(i) for i in range(1, 10)]
    )
    # Split df into X and y
    y = df['V10'].copy()
    X = df.drop('V10', axis=1).copy()
    
    # X_Train and Y_Train denotes training data subset
    # X_Test and Y_test denotes testing data.
    # train_size is a tunable parameter, and it indicates how much of the
    # dataset is allocated to training/testing data.
    X_train, X_test, y_train, y_test = train_test_split(X, y, train_size=trn_data, random_state=123)
    
    return X_train, X_test, y_train, y_test
trn_data = 0.66
X_train, X_test, y_train, y_test = preprocess_inputs(data, trn_data)

models = {
    "K-Nearest Neighbors": KNeighborsClassifier(),
    "Logistic Regression": LogisticRegression(),
    "Decision Tree": DecisionTreeClassifier(),
}

for name, model in models.items():
    model.fit(X_train, y_train)
    print(name + " trained.")

model_fitness = []
print('\nTraining Data represents ' + str(100 * trn_data) +'% of Dataset.\n')    
for name, model in models.items():
    print(name + " Accuracy: {:.2f}%".format(model.score(X_test, y_test) * 100))
    model_fitness.append( model.score(X_test, y_test) )


training_array = np.linspace(0.025,0.975,100)
'''Now that we have established Linear Regression as the best predictor
Lets train it several times with different percentages of the total dataset
for training.'''
logreg_fitness = []
knn_fitness = []
dt_fitness = []
for trn_data in training_array:
    X_train, X_test, y_train, y_test = preprocess_inputs(data, trn_data)
    logreg = LogisticRegression()
    knn = KNeighborsClassifier()
    dt = DecisionTreeClassifier(max_depth = 8, min_samples_leaf = 4)
    logreg.fit(X_train, y_train)
    knn.fit(X_train, y_train)
    dt.fit(X_train, y_train)
    logreg_fitness.append( logreg.score(X_test, y_test) )
    knn_fitness.append( knn.score(X_test, y_test) )
    dt_fitness.append( dt.score(X_test, y_test) )

dt_data = tree.export_graphviz(dt, out_file=None,
                      filled=True, rounded=True,  
                      special_characters=True)
graph = graphviz.Source(dt_data) 
graph.render("iris") 


plt.plot(logreg_fitness)
plt.ylabel('Logistic Regression Fitness')
plt.xlabel('Percent of data used for training')
plt.title('Model Fitness vs Percent of training data.')
plt.show()

plt.plot(training_array, logreg_fitness,label='Logistic Regression')
plt.plot(training_array, knn_fitness,label='KNN')
plt.ylabel('Model Fitness')
plt.xlabel('Percent of data used for training')
plt.title('Model Fitness vs Percent of training data.')
plt.legend(loc='lower right')
plt.show()

plt.plot(training_array, logreg_fitness,label='Logistic Regression')
plt.plot(training_array, dt_fitness,label='Decision Tree')
plt.ylabel('Model Fitness')
plt.xlabel('Percent of data used for training')
plt.title('Tuned Decision Tree vs Logistic Regression')
plt.legend(loc='lower right')
plt.show()

# Part 2 of Project Begins here

trn_data = 0.5
X_train, X_test, y_train, y_test = preprocess_inputs(data, trn_data)

# reducing the dimension.
pca = PCA(0.95) #This line indicates that we should use components such that 95% of the original variance is kept
principalComponents = pca.fit_transform(X_train)

new_X = pca.transform(X_train)
new_X_test = pca.transform(X_test)

new_model = LogisticRegression()
new_model.fit(X_train, y_train)
new_model.score(X_test, y_test)

print('PCA Fitted Logistic Regression:' + " Accuracy: {:.2f}%".format(100 * new_model.score(X_test, y_test)))
