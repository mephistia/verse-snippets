<#>

  ############################################################################################

  MIT License

  Copyright (c) 2024 Julia Castro Stefanello

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.

############################################################################################





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


