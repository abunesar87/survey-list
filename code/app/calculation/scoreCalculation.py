class CalculateAnswerScore:

    def __init__(self, answer, score_reverse):
        try: 
            answer = int(answer)
        except ValueError:
            answer = -1
        
        if answer >= 1 and answer <= 6:
            if answer == 5:
                answer = 4
            if answer == 6:
                self.score = 0
            else:
                if score_reverse:
                    self.score = 5 - answer
                else:
                    self.score = answer
        else:
            self.score = answer

    def get_score(self):
        return self.score


class CalculateSurveyScore:

    def __init__(self, scores):
        self.scores = scores

    def get_score(self):
        count = 0
        for i in self.scores:
            if self.scores[i]==0:
                count = count + 1
        return (((sum(self.scores.values()) / (len(self.scores) - count)) - 1) / 3) * 100
