# These methods can be used on any array to facilitate a Stack behavior (last in, first out)

(Input : []t where t : type).Push<public>(Item : t)<decides><transacts>:[]t= {
  IndexToInsert := Input.Length
  return Input.Insert[IndexToInsert, array{Item}]
}

(Input : []t where t : type).Pop<public>()<decides><transacts>:tuple(?t, []t)= {
  IndexToRemove := Input.Length - 1
  var UpdatedInput : []t = Input
  var MaybeRemovedItem : ?t = false

  if(RemovedItem := Input[IndexToRemove], UpdatedArr := Input.RemoveElement[IndexToRemove]) {
    set MaybeRemovedItem = option{RemovedItem}
    set UpdatedInput = UpdatedArr
  }
  
  return (MaybeRemovedItem, UpdatedInput)
}



# Example of use:

var SomeArray : []int = array{}
SomeValue : int = 100

if(UpdatedArray := SomeArray.Push[SomeValue]) {
  set SomeArray = UpdatedArray
}

if(PopResult := SomeArray.Pop[], LastValue := PopResult(0)?){
  set SomeArray = PopResult(1)
  Print("Last Value was {LastValue}") # 100
}


