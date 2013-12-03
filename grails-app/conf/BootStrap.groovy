import com.jmguilla.eev.EEV
import com.jmguilla.eev.EEVRow
import com.jmguilla.eev.EEVRowsGroup
import com.jmguilla.eev.Question

class BootStrap {

    def init = { servletContext ->
      
      //initializing data
      EEV eevTemplate = new EEV(title: 'Ecoute d\'entretien de vente')
      eevTemplate = eevTemplate.save(failOnError: true)
      
      EEVRowsGroup group = new EEVRowsGroup(title: 'Avant d\'entrer en scène')
      group = group.save(failOnError: true)
      group.addToRows(new EEVRow( rank: 1, question: new Question(question: "connaît les stocks produits phares").save(failOnError: true)))
      group.addToRows(new EEVRow( rank: 2, question: new Question(question: "connaît les priorités produits du jour").save(failOnError: true)))
      group.addToRows(new EEVRow( rank: 3, question: new Question(question: "connaît ses objectifs").save(failOnError: true)))
      group.addToRows(new EEVRow( rank: 4, question: new Question(question: "dispose des outils d'aide à la vente").save(failOnError: true)))
      group.addToRows(new EEVRow( rank: 4, question: new Question(question: "porte une tenue adéquate à la relation client").save(failOnError: true)))
      eevTemplate.addToGroups(group.save(failOnError: true)).save(failOnError: true)
      
    }
    def destroy = {
    }
}
