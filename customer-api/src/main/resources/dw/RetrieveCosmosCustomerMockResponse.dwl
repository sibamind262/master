%dw 2.0
output application/json
---
{
  personalInformation: {
    firstName: "Ulrich",
    lastName: "Nielsen",
    companyName: "E-ffoc",
    email: "ulrichN@effoc.com",
    phone: "+494341927420"
  },
  address: [
    {
      street: "Steinbrueckstrasse",
      houseNumber: 114,
      city: "Nuremberg",
      country: "Germany",
      postalCode: "90408"
    }
  ]
}