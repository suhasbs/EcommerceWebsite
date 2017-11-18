from sklearn.metrics.pairwise import cosine_similarity
from scipy import sparse
import numpy as np
import cPickle
# A =  np.array([[0, 1, 0, 0, 1], [0, 0, 1, 1, 1],[1, 1, 0, 1, 0]])
# A_sparse = sparse.csr_matrix(A)

# similarities = cosine_similarity(A_sparse)
# print('pairwise dense output:\n {}\n'.format(similarities))

# #also can output sparse matrices
# similarities_sparse = cosine_similarity(A_sparse,dense_output=False)
# # print('pairwise sparse output:\n {}\n'.format(similarities_sparse))

# print type(similarities_sparse)

# def create_one_hot (user_dictionary)

class e_commerce():

    def __init__(self,item_list,user_list):

        self.item_list = item_list # assumed no change
        self.user_list = user_list
        self.shopping_dict = self.create_dictionary(self.user_list)

    def create_dictionary(self,user_list):

        shopping_dict = {}

        for user in user_list:
            shopping_dict[user] = set()
        
        return shopping_dict

    def add_new_user (self, user):
        print 'adding '+user+' to shopping dict'
        self.shopping_dict[user] = set()
        self.user_list.append(user)

    

    def shop(self,user,shopping_cart): #to be called after he purchases the items

        for item in shopping_cart:

            self.shopping_dict[user].add(item)
        print "In shopping- "+str(self.shopping_dict)
    

    def create_one_hot(self):

        one_hot = np.zeros((len(self.item_list),len(self.user_list)),dtype=np.int32)

        for i in range(len(self.user_list)):

            for j in range(len(self.item_list)):

                user = self.user_list[i]
                item = self.item_list[j]

                if item in self.shopping_dict[user] :

                    one_hot[j][i]=1
        

        return one_hot

    def get_item_vector(self,item,one_hot):

        for i in range(len(self.item_list)):

            if(self.item_list[i] == item) :
                return one_hot[i]
    
    def recommend(self, num_recommendations,user,item_being_bought):

        one_hot = self.create_one_hot()

        ans = set()

        vector_item_being_bought = self.get_item_vector(item_being_bought,one_hot)

        for user in self.user_list :

            if item_being_bought in self.shopping_dict[user] :

                print user
                for item in self.shopping_dict[user]:

                    if item != item_being_bought :

                        A = [self.get_item_vector(item,one_hot),vector_item_being_bought]
                        # print A
                        A_sparse = sparse.csr_matrix(A)
                        # print A_sparse
                        similarity = cosine_similarity(A_sparse)[0,1]

                        #print user,item,similarity

                        if(len(ans) < num_recommendations):

                            ans.add((similarity,item))

                            # print ans.pop()[0]
                            #print ans

                        else:

                            for min_similarity in ans:
                                break
                            ans.remove(min_similarity)
                            print 'min_similarity',min_similarity
                            print 'before',ans

                            if(similarity > min_similarity[0]):
                                ans.add((similarity,item))
                            else :
                                ans.add(min_similarity)
                            print 'after',ans

        recommendations = []
        for x in ans:
                recommendations.append(x[1])
        print ans
        return recommendations

try:
    print 'tried'
    f = open('recommender.save', 'rb')
    print 'opened'
    recommender = cPickle.load(f)
    print 'unpickled'
    print recommender.shopping_dict
    f.close()
except Exception as e:
    print 'failed -'+e.message
    f = open('pdt_list','rb')
    item_list = cPickle.load(f)
    print 'unpickled default'
    f.close()
    user_list=['admin']
    recommender = e_commerce(item_list, user_list)
    print recommender.item_list

if __name__ == '__main__' :

    item_list = ['Harry_potter_1','Harry_potter_2','MotoG4','MotoG4_cover','Sony_head_phone','dell_laptop','dell_adapter','motoG5']
    user_list = ['vikram','suhas','aditya','rakshith']


    # shopping_dict = create_dictionary(user_list)

    # print shopping_dict

    ec = e_commerce(item_list,user_list)

    ec.shop('aditya',['MotoG4','dell_laptop','dell_adapter','MotoG4_cover','motoG5'])

    ec.shop('vikram',['Harry_potter_1','Harry_potter_2','dell_laptop','dell_adapter'])

    print ec.shopping_dict
    print ec.create_one_hot()
    print ec.recommend(2,'suhas','MotoG4')
    print ec.recommend(1,'rakshith','dell_laptop')
