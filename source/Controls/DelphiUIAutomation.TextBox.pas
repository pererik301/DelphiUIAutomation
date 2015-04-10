{***************************************************************************}
{                                                                           }
{           DelphiUIAutomation                                              }
{                                                                           }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}
unit DelphiUIAutomation.TextBox;

interface

uses
  DelphiUIAutomation.Base,
  UIAutomationClient_TLB;

type
  /// <summary>
  ///  Represents a text box
  /// </summary>
  /// <remarks>
  ///  TEdit for example.
  /// </remarks>
  TAutomationTextBox = class (TAutomationBase)
  private
    function getText: string;
  public
    ///<summary>
    ///  Gets or sets the text
    ///</summary>
    property Text : string read getText;
  end;

implementation

uses
  DelphiUIAutomation.Exception,
  DelphiUIAutomation.PatternIDs,
  sysutils;

{ TAutomationTextBox }

function TAutomationTextBox.getText: string;
var
  Inter: IInterface;
  ValPattern  : IUIAutomationValuePattern;
  value : widestring;

begin
  result := '';
  fElement.GetCurrentPattern(UIA_ValuePatternId, inter);

  if inter <> nil then
  begin
    if Inter.QueryInterface(IID_IUIAutomationValuePattern, ValPattern) = S_OK then
    begin
      ValPattern.Get_CurrentValue(value);
      Result := trim(value);
    end;
  end;
end;

end.
