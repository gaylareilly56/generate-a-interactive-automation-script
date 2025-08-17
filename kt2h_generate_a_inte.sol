pragma solidity ^0.8.0;

contract InteractiveAutomationScriptIntegrator {
    struct AutomationScript {
        uint256 id;
        string scriptName;
        string scriptCode;
        string[] inputs;
        string[] outputs;
        bool isActive;
    }

    struct Integration {
        uint256 id;
        uint256 automationScriptId;
        string integrationName;
        string[] integrationInputs;
        string[] integrationOutputs;
    }

    mapping(uint256 => AutomationScript) public automationScripts;
    mapping(uint256 => Integration) public integrations;

    uint256 public automationScriptCount;
    uint256 public integrationCount;

    event AutomationScriptAdded(uint256 id, string scriptName);
    event AutomationScriptUpdated(uint256 id, string scriptCode);
    event IntegrationAdded(uint256 id, uint256 automationScriptId);

    function addAutomationScript(string memory _scriptName, string memory _scriptCode, string[] memory _inputs, string[] memory _outputs) public {
        automationScriptCount++;
        AutomationScript storage newScript = automationScripts[automationScriptCount];
        newScript.id = automationScriptCount;
        newScript.scriptName = _scriptName;
        newScript.scriptCode = _scriptCode;
        newScript.inputs = _inputs;
        newScript.outputs = _outputs;
        newScript.isActive = true;
        emit AutomationScriptAdded(automationScriptCount, _scriptName);
    }

    function updateAutomationScript(uint256 _id, string memory _scriptCode) public {
        AutomationScript storage script = automationScripts[_id];
        script.scriptCode = _scriptCode;
        emit AutomationScriptUpdated(_id, _scriptCode);
    }

    function addIntegration(uint256 _automationScriptId, string memory _integrationName, string[] memory _integrationInputs, string[] memory _integrationOutputs) public {
        integrationCount++;
        Integration storage newIntegration = integrations[integrationCount];
        newIntegration.id = integrationCount;
        newIntegration.automationScriptId = _automationScriptId;
        newIntegration.integrationName = _integrationName;
        newIntegration.integrationInputs = _integrationInputs;
        newIntegration.integrationOutputs = _integrationOutputs;
        emit IntegrationAdded(integrationCount, _automationScriptId);
    }

    function getAutomationScript(uint256 _id) public view returns (AutomationScript memory) {
        return automationScripts[_id];
    }

    function getIntegration(uint256 _id) public view returns (Integration memory) {
        return integrations[_id];
    }
}