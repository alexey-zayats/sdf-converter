package kf

// Events ...
func Events() SubmitEvents {
	return SubmitEvents{
		"submit": []map[string]interface{}{
			{
				"eventType": "submit",
				"_id":       0,
				"context":   nil,
				"requestBinding": map[string]interface{}{
					"order": map[string]string{
						"id": "__orderId",
					},
					"draft": map[string]interface{}{
						"id":      "__draftId",
						"version": "__draftVersion",
					},
				},
				"responseBinding": map[string]interface{}{
					"draft": map[string]interface{}{
						"id":      "__draftId",
						"version": "__draftVersion",
					},
				},
				"processor": "saveDraftProcessor",
			},
		},
	}
}
