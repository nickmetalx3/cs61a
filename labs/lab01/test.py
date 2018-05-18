# domain - set of all inputs
# range - set of all outputs
# pure function behaviour - relation b/w input and output.

# Give each function exactly one job.
# Don't repeat yourself.
# Define functions generally. 

"""Generalization."""

def curried_pow(x):
	def h(y):
		return pow(x, y)
	return h

def map_to_range(start, end, f):
	assert start < end
	while start < end:
		print (f(start))
		start += 1


def add_two(x, y):
	return x + y

def add_two(x):
	def g(y):
		return x + y
	return g

def curry2(f):
	def g(x):
		def h(y):
			return f(x, y)
		return h

	return g

def uncurry2(g):
	def f(x, y):
		return g(x)(y)

	return f
