from sklearn.linear_model import LinearRegression
import pandas
import coremltools

data = pandas.read_csv("surfs.csv")

model = LinearRegression()
model.fit(data[["model", "premium", "mileage", "condition"]], data["price"])

coreml_model = coremltools.converters.sklearn.convert(model, ["model", "premium", "mileage", "condition"], "price")
coreml_model.author = "Marina&Marina"
coreml_model.license = "CC0"
coreml_model.short_description = "Predicts the trade-in price of a surfboard."
coreml_model.save("Surfs.mlmodel")
