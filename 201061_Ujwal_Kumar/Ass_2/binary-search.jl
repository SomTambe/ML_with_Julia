function binarysearch(array, key; by=identity, rev = false, lt = <)
			         l=1
				     r=length(array)
				         if rev
					         lt = >
						     end
						         while l ≤ r
							         i = Int(floor((l+r)/2))
								         if lt(by(array[i]), by(key))
									             l = i +1
										             elseif lt(by(key), by(array[i]))
											                 r = i - 1
													         else 
														             l = r = i
															                 break
																	         end
																		     end
																		         l:r
																			 end

