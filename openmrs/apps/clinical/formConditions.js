Bahmni.ConceptSet.FormConditions.rules = {
    'Diastolic Data' : function (formName, formFieldValues) {
        var systolic = formFieldValues['Systolic'];
        var diastolic = formFieldValues['Diastolic'];
        if (systolic || diastolic) {
            return {
                enable: ["Posture"]
            }
        } else {
            return {
                disable: ["Posture"]
            }
        }
    },
    'Systolic Data' : function (formName, formFieldValues) {
        var systolic = formFieldValues['Systolic'];
        var diastolic = formFieldValues['Diastolic'];
        if (systolic || diastolic) {
            return {
                enable: ["Posture"]
            }
        } else {
            return {
                disable: ["Posture"]
            }
        }
    },
        'Mode of Delivery' : function (formName, formFieldValues) {
        var delivery_mode = formFieldValues['Mode of Delivery'];
        
        if (delivery_mode =="Others") {
            return {
                enable: ["Other Mode of Delivery"]
            }
        } else {
            return {
                disable: ["Other Mode of Delivery"]
            }
        }
    },
            'Term' : function (formName, formFieldValues) {
        var delivery_term = formFieldValues['Term'];
        
        if (delivery_term =="Others") {
            return {
                enable: ["Other Term"]
            }
        } else {
            return {
                disable: ["Other Term"]
            }
        }
    }
};