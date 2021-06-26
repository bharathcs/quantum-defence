extends Tower

onready var qn: QuantumNode = $QuantumNode
var probs: Dictionary

var qubit_called = 0
onready var func_ref
# func _ready() -> void:
# 	self.isTensor = true
# 	qn.qc.set_circuit(1,1)
# 	qn.qc.h(0)
# 	probs = qn.simulate_and_get_probabilities_dict()
# 	print(probs)

func _fire():
	var weapon = ._fire()
	weapon.set_prob(probs)


func _ready():
	self.isTensor = true
	qn.qc.set_circuit(1,1)

	#Set up all the functions to reference later
	func_ref = {
		"h" : funcref(qn.qc, "h"),
		"x" : funcref(qn.qc, "x"),
		"y" : funcref(qn.qc, "y"),
		"rx" : funcref(qn.qc, "rx"),
		"ry" : funcref(qn.qc, "ry"),
		"rz" : funcref(qn.qc, "rz"),
		"cx" : funcref(qn.qc, "cx"),
		"crx" : funcref(qn.qc, "crx")
	}

	func_ref["rx"].call_func(qubit_called)
	func_ref["ry"].call_func(qubit_called)
	probs = qn.simulate_and_get_probabilities_dict()
	print(probs)	

# func update_quantum_circuit(qc: Array) -> void:
# 	#Gate is a string im, the name of the gate 
# 	for gate in qc:
		
