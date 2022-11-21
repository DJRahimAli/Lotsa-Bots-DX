function Sequence_Destroy()
{
	layer_sequence_destroy(self.elementID);
}

function Sequence_Ending()
{
	layer_sequence_destroy(self.elementID);
	room_goto(rTitle);
}
